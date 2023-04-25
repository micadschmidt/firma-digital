require 'openssl'
require 'prawn'
require 'combine_pdf'

class DocumentsController < ApplicationController
  # Este metodo crea una instancia de un nuevo documento para ser firmado. Renderiza una vista donde se puede subir un archivo PDF
  def new
    @document = Document.new
  end

  # Este método se encarga de recibir los datos del formulario que se utiliza para subir el archivo PDF, crea una nueva instancia de Document y lo guarda en la base de datos. Si la operación es exitosa, se redirige a la página para firmar el documento. Si falla, se renderiza la vista de nuevo documento.
  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to sign_document_path(@document)
    else
      render :new
    end
  end

  # Este método es el encargado de crear una instancia de una nueva firma para el documento seleccionado. Renderiza una vista con un formulario para que el usuario ingrese su información y la llave privada para firmar el documento.
  def sign
    @document = Document.find(params[:id])
    @signature = Signature.new
  end

  # Este método es el encargado de realizar la firma del documento. Utiliza la información recibida del formulario para generar la firma en cada página del PDF seleccionado y guarda el resultado en un nuevo archivo PDF. Luego envía el archivo al usuario para descargar.
  def sign_document
    @document = Document.find(params[:id])
    @signature = Signature.new(signature_params)

    key = OpenSSL::PKey::RSA.new(@signature.key)

    pdf = CombinePDF.load(@document.pdf_file.path)
    pdf.pages.each do |page|
      signature = {
        name: @signature.name,
        page: page.number,
        x: page.width - 100,
        y: 50,
        text: "#{@signature.name} #{@signature.lastname}, #{@signature.date}"
      }
      page.sign_signature(signature, key)
    end
    pdf.save('documento_firmado.pdf')
    send_file 'documento_firmado.pdf', filename: 'documento_firmado.pdf', type: 'application/pdf'
  end

  # Este método permite al usuario descargar el archivo PDF firmado previamente.
  def download_signed
    @document = Document.find(params[:id])
    send_file @document.signed_pdf_file.path, filename: 'documento_firmado.pdf', type: 'application/pdf'
  end


  # Para extraer los campos necesarios para crear los objetos Document y Signature respectivamente.
  private

  def document_params
    params.require(:document).permit(:pdf_file)
  end

  def signature_params
    params.require(:signature).permit(:name, :lastname, :date, :key)
  end
end
