
class Testscript < Formula
  desc ""
  homepage ""
  url "https://github.com/gborowik/testscript/archive/v1.0.0.tar.gz"
  sha256 "a2cd0df31388b97b9474ffd527e4ae280e9c6da2dafcc1d6f1b0cbdbff119c81"

  def install
	bin.install "testscript"

  resource("https://github.com/golemfactory/golem/wiki/wheels/sip-4.19-cp27-cp27m-macosx_10_12_x86_64.whl")
      .stage { system python, "setup.py", "install" }
  end

end
