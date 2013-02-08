require File.expand_path(File.join(File.dirname(__FILE__), "helper"))
require 'lib/sha1'
context "Sha1" do
  test "#general" do
    sha1 = Sha1.hash("cde")
    assert_equal "5af13954a67eab2973b4ade01186602dd8739787", sha1
    assert_instance_of String, sha1
  end
end