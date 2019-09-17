# coding: utf-8

module ONIX
  class Contributor
    include ROXML

    xml_name "Contributor"

    xml_accessor :sequence_number,             :from => "SequenceNumber", :as => Integer
    xml_accessor :contributor_role,            :from => "ContributorRole"
    xml_accessor :language_code,               :from => "LanguageCode"
    xml_accessor :sequence_number_within_role, :from => "SequenceNumberWithinRole", :as => Integer
    xml_accessor :person_name,                 :from => "PersonName"
    xml_accessor :person_name_inverted,        :from => "PersonNameInverted"
    xml_accessor :titles_before_names,         :from => "TitlesBeforeNames"
    xml_accessor :names_before_key,            :from => "NamesBeforeKey"
    xml_accessor :prefix_to_key,               :from => "PrefixToKey"
    xml_accessor :key_names,                   :from => "KeyNames"
    xml_accessor :names_after_key,             :from => "NamesAfterKey"
    xml_accessor :suffix_to_key,               :from => "SuffixToKey"
    xml_accessor :letters_after_names,         :from => "LettersAfterNames"
    xml_accessor :titles_after_names,          :from => "TitlesAfterNames"
    xml_accessor :corporate_name,              :from => "CorporateName"
    xml_accessor :biographical_note,           :from => "BiographicalNote"
    xml_accessor :contributor_description,     :from => "ContributorDescription"
    xml_accessor :unnamed_persons,             :from => "UnnamedPersons", :as => Integer, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :country_code,                :from => "CountryCode"
    xml_accessor :region_code,                 :from => "RegionCode"
    xml_accessor :person_name_identifiers,     :from => "PersonNameIdentifier", :as => [ONIX::PersonNameIdentifier]
    xml_accessor :names,                       :from => "Name", :as => [ONIX::Name]
    xml_accessor :person_dates,                :from => "PersonDate", :as => [ONIX::PersonDate]
    xml_accessor :professional_affiliations,   :from => "ProfessionalAffiliation", :as => [ONIX::ProfessionalAffiliation]
    xml_accessor :websites,                    :from => "Website", :as => [ONIX::Website]

    def initialize
      self.person_name_identifiers = []
      self.names = []
      self.person_dates = []
      self.professional_affiliations = []
      self.websites = []
    end
  end
end
