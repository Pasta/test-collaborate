class DocumentChannel < Collaborate::CollaborationChannel
  private

  # Set the Model class that we are editing.
  def document_type
    Document
  end
end
