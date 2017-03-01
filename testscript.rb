class WheelCurlDownloadStrategy < CurlDownloadStrategy
  def initialize(name, resource)
    super
    @tarball_path = HOMEBREW_CACHE.join("#{name}")
  end
end

class WheelResource < Resource
  def downloader
    download_strategy = WheelCurlDownloadStrategy
    download_strategy.new(File.basename(url), Download.new(self))
  end
end

class Testscript < Formula
  desc ''
  homepage ''
  url 'https://github.com/gborowik/testscript/archive/v1.0.0.tar.gz'
  sha256 'a2cd0df31388b97b9474ffd527e4ae280e9c6da2dafcc1d6f1b0cbdbff119c81'


  resource 'sip', WheelResource do
    url 'https://github.com/golemfactory/golem/wiki/wheels/sip-4.19-cp27-cp27m-macosx_10_12_x86_64.whl'
    sha256 '65e8670bf1f72c54a1cdc0a4756c42951530f9bce7bac7ac5d2df99a727f37c4'
  end

  def install

    res = resource('sip')
    res.stage do
      do_install(res.downloader.cached_location)
    end

    bin.install "testscript"

  end

  def do_install(targets)
    targets = [targets] unless targets.is_a? Array
    system "#{HOMEBREW_PREFIX}/bin/pip",
           'install',
           '-v',
           *targets
  end
  
end
