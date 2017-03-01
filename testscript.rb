# Specify wheel resource's name as it is
class WheelCurlDownloadStrategy < CurlDownloadStrategy
  def initialize(name, resource)
    super
    @tarball_path = HOMEBREW_CACHE.join("#{name}")
  end
end

# Use WheelCurlDownloadStrategy for download
# and use proper name of wheel resource (from url)
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

  depends_on 'python'
  depends_on 'qt@5.7'
  depends_on 'docker-machine'
  depends_on 'xhyve'
  depends_on 'docker-machine-driver-xhyve'
  depends_on 'https://gist.github.com/shazow/c71c652409015479a7e6/raw/secp256k1.rb'
  depends_on 'ethereum/ethereum/ethereum'
  depends_on 'ipfs'
  depends_on 'openexr'


  resource 'sip', WheelResource do
    url 'https://github.com/golemfactory/golem/wiki/wheels/sip-4.19-cp27-cp27m-macosx_10_12_x86_64.whl'
    sha256 '65e8670bf1f72c54a1cdc0a4756c42951530f9bce7bac7ac5d2df99a727f37c4'
  end

  resource 'PyQt5', WheelResource do
    url 'https://github.com/golemfactory/golem/wiki/wheels/PyQt5-5.7.1-cp27-cp27m-macosx_10_12_x86_64.whl'
    sha256 '1a5ed4c81a53607731aee5a42999ec142ad8ab0fb7f9869dc0d1b728221ab182'
  end


  def install

    # download wheel resources
    # check sha256
    # and pip install from cached location
    res = resource('sip')
    res.stage do
      do_install(res.downloader.cached_location)
    end

    res = resource('PyQt5')
    res.stage do
      do_install(res.downloader.cached_location)
    end


    #todo

    #do_install('pip-resource')

    #bin.install "testscript"

  end

  # pip install wheel resource or array of wheel resources (verbose)
  def do_install(targets)
    targets = [targets] unless targets.is_a? Array
    system "#{HOMEBREW_PREFIX}/bin/pip",
           'install',
           '-v',
           *targets
  end

end
