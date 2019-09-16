# coding: utf-8

module ONIX
  class Name
    include ROXML

    xml_name "Name"

    xml_accessor :person_name_type,        :from => "PersonNameType", :as => Integer, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :person_name,             :from => "PersonName"
    xml_accessor :person_name_inverted,    :from => "PersonNameInverted"
    xml_accessor :titles_before_names,     :from => "TitlesBeforeNames"
    xml_accessor :names_before_key,        :from => "NamesBeforeKey"
    xml_accessor :prefix_to_key,           :from => "PrefixToKey"
    xml_accessor :key_names,               :from => "KeyNames"
    xml_accessor :names_after_key,         :from => "NamesAfterKey"
    xml_accessor :suffix_to_key,           :from => "SuffixToKey"
    xml_accessor :letters_after_names,     :from => "LettersAfterNames"
    xml_accessor :titles_after_names,      :from => "TitlesAfterNames"
    xml_accessor :person_name_identifiers, :from => "PersonNameIdentifier", :as => [ONIX::PersonNameIdentifier]

    def initialize
      self.person_name_identifiers = []
    end
  end
end
