require '/usr/local/Homebrew/Library/Homebrew/language/python'

class Testscript < Formula
  desc ""
  homepage ""
  url "https://github.com/gborowik/testscript/archive/v1.0.0.tar.gz"
  sha256 "a2cd0df31388b97b9474ffd527e4ae280e9c6da2dafcc1d6f1b0cbdbff119c81"

  resource "sip" do
    url "https://github.com/golemfactory/golem/wiki/wheels/sip-4.19-cp27-cp27m-macosx_10_12_x86_64.whl"
    sha256 "65e8670bf1f72c54a1cdc0a4756c42951530f9bce7bac7ac5d2df99a727f37c4"
  end



  def install
  #bin.install "testscript"
  # resource("sip").stage { system python, "setup.py", "install" }
    #exec 'ls -la'

    #exec 'pwd'
    #%x(sudo pip install "https://github.com/golemfactory/golem/wiki/wheels/sip-4.19-cp27-cp27m-macosx_10_12_x86_64.whl")
    #system("python get-pip.py")
    #system("pip install -U pip")
    #system("pip install 'https://github.com/golemfactory/golem/wiki/wheels/sip-4.19-cp27-cp27m-macosx_10_12_x86_64.whl'")

    Language::Python::Virtualenv::Virtualenv.pip_install("sip")
  end

end
