# coding: utf-8

module ONIX
  class MediaFile
    include ROXML

    xml_name "MediaFile"

    xml_accessor :media_file_type_code, :from => "MediaFileTypeCode", :as => Integer, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :media_file_format_code, :from => "MediaFileFormatCode", :as => Integer, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :image_resolution, :from => "ImageResolution"
    xml_accessor :media_file_link_type_code, :from => "MediaFileLinkTypeCode", :as => Integer, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :media_file_link, :from => "MediaFileLink"
  end
end
