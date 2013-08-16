require 'idn'
include IDN

# STRINGPREP test vectors: UTF-8 encoded strings and the corresponding
# prepared form, according to the given profile.

TESTCASES_STRINGPREP = {
  'A' => [ "Nameprep", "\xC5\x83\xCD\xBA", "\xC5\x84 \xCE\xB9" ],
  'B' => [ "Nodeprep", "\xE1\xBE\xB7", "\xE1\xBE\xB6\xCE\xB9" ],
  'C' => [ "Resourceprep", "foo@bar", "foo@bar" ],
  'D' => [ "ISCSIprep", "Example-Name", "example-name" ],
  'E' => [ "SASLprep", "Example\xC2\xA0Name", "Example Name" ]
}

# STRINGPREP_INVALID test vectors: invalid input strings and their
# corresponding profile.

TESTCASES_STRINGPREP_INVALID = {
  'A' => [ "Nodeprep", "toto@a/a" ]
}

# NFKC test vectors: UTF-8 encoded strings and the corresponding
# normalized form, according to NFKC normalization mode.

TESTCASES_NFKC = {
  'A' => [ "\xC2\xB5", "\xCE\xBC" ],
  'B' => [ "\xC2\xAA", "\x61" ]
}

describe Stringprep do
  it 'should pass profile_STRINGPREP' do
    TESTCASES_STRINGPREP.each do |key, val|
      rc = Stringprep.with_profile(val[1], val[0])
      val[2].should eq(rc)
    end
  end

  #it 'should pass profile_STRINGPREP_INVALID' do
  #  TESTCASES_STRINGPREP_INVALID.each do |key, val|
  #    assert_raise(Stringprep::StringprepError, "TestCase #{key} failed") do
  #      Stringprep.with_profile(val[0], val[1])
  #    end
  #  end
  #end

  it 'should pass nfkc_normalize_NFKC' do
    TESTCASES_NFKC.each do |key, val|
      rc = Stringprep.nfkc_normalize(val[0])
      val[1].should eq(rc)
    end
  end
end
