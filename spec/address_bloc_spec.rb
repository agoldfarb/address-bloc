require_relative '../models/address_book.rb'

RSpec.describe AddressBook do 
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end

  context "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(book.entries.size). to eq 0
    end
  end

  context ".add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

     expect(new_entry.name).to eq 'Ada Lovelace'
     expect(new_entry.phone_number).to eq '010.012.1815'
     expect(new_entry.email).to eq 'augusta.king@lovelace.com'
   end
 end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size

      expect(book_size).to eql 3
    end

    it  "checks the details of the first entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "allison", "555-555-5555", "allison@blocmail.com")
    end

    it "checks the details of the second entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "lily", "555-555-5555", "lily@blocmail.com")
    end

    it "checks the details of the third entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "will", "555-555-5555", "will@blocmail.com")
    end

  end

end
