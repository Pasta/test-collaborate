class Document < ApplicationRecord
  # Include the Collaborate::Document concern
  include Collaborate::Document

  # Choose which attributes may be edited collaboratively
  collaborative_attributes :body
end
