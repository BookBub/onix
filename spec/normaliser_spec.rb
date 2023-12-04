# coding: utf-8

require File.dirname(__FILE__) + '/spec_helper.rb'

describe ONIX::Normaliser, "with a simple short tag file" do

  before(:each) do
    @data_path = File.join(File.dirname(__FILE__),"..","data")
    @filename  = File.join(@data_path, "short_tags.xml")
    @outfile   = @filename + ".new"
  end

  after(:each) do
    File.unlink(@outfile) if File.file?(@outfile)
  end

  it "should correctly convert short tag file to reference tag" do
    ONIX::Normaliser.process(@filename, @outfile)

    File.file?(@outfile).should be_true
    content = File.read(@outfile)
    content.include?("<m174>").should be_false
    content.include?("<FromCompany>").should be_true
  end
end

describe ONIX::Normaliser, "with a simple short tag file that has no doctype" do

  before(:each) do
    @data_path = File.join(File.dirname(__FILE__),"..","data")
    @filename  = File.join(@data_path, "short_tags_no_doctype.xml")
    @outfile   = @filename + ".new"
  end

  after(:each) do
    File.unlink(@outfile) if File.file?(@outfile)
  end

  it "should correctly convert short tag file to reference tag" do
    pending
    ONIX::Normaliser.process(@filename, @outfile)

    File.file?(@outfile).should be_true
    content = File.read(@outfile)
    content.include?("<m174>").should be_false
    content.include?("<FromCompany>").should be_true
  end
end

describe ONIX::Normaliser, "with a short tag file that include HTML tags" do

  before(:each) do
    @data_path = File.join(File.dirname(__FILE__),"..","data")
    @filename  = File.join(@data_path, "short_tags_ivp.xml")
    @outfile   = @filename + ".new"
  end

  after(:each) do
    File.unlink(@outfile) if File.file?(@outfile)
  end

  it "should correctly convert short tag file to reference tag" do
    ONIX::Normaliser.process(@filename, @outfile)

    File.file?(@outfile).should be_true
    content = File.read(@outfile)
    content.include?("<m174>").should be_false
    content.include?("<FromCompany>").should be_true
    content.include?("<em>Discipleship Essentials</em>").should be_true
  end

end

describe ONIX::Normaliser, "with a utf8 file that has illegal control chars" do

  before(:each) do
    @data_path = File.join(File.dirname(__FILE__),"..","data")
    @filename  = File.join(@data_path, "control_chars.xml")
    @outfile   = @filename + ".new"
  end

  after(:each) do
    File.unlink(@outfile) if File.file?(@outfile)
  end

  it "should remove all control chars except LF, CR and TAB" do
    ONIX::Normaliser.process(@filename, @outfile)

    File.file?(@outfile).should be_true
    content = File.read(@outfile)

    content.include?("<TitleText>OXFORDPICTURE DICTIONARY CHINESE</TitleText>").should be_true
  end
end

describe ONIX::Normaliser, "with a file with an incorrect encoding and a correct encoding provided" do

  before(:each) do
    @data_path = File.join(File.dirname(__FILE__),"..","data")
    @filename  = File.join(@data_path, "iso_8859_1_data.xml")
    @outfile   = @filename + ".new"
  end

  after(:each) do
    File.unlink(@outfile) if File.file?(@outfile)
  end

  it "should treat the file as the given encoding and handle special characters and not edit any contained xml declarations" do
    ONIX::Normaliser.process(@filename, @outfile, { encoding: 'UTF-8' })

    File.file?(@outfile).should be_true
    content = File.read(@outfile)

    content.include?("RITA®").should be_true
    content.include?("face-to-face with her ex-fiancé").should be_true
    content.include?('xml:lang="EN-GB"').should be_true
  end
end

describe ONIX::Normaliser, "with a file no encoding provided" do

  before(:each) do
    @data_path = File.join(File.dirname(__FILE__),"..","data")
    @filename  = File.join(@data_path, "missing_header.xml")
    @outfile   = @filename + ".new"
  end

  after(:each) do
    File.unlink(@outfile) if File.file?(@outfile)
  end

  it "should treat the file as the given encoding and handle special characters" do
    ONIX::Normaliser.process(@filename, @outfile, { encoding: 'ISO-8859-1' })

    File.file?(@outfile).should be_true
    content = File.read(@outfile)

    content.include?("RITAÂ®").should be_true
    content.include?("face-to-face with her ex-fiancÃ©").should be_true
  end
end
