require 'formula'

class Createrepo < Formula
  homepage 'http://createrepo.baseurl.org//'
  url 'http://createrepo.baseurl.org/download/createrepo-0.4.11.tar.gz' 
  sha1 '10316e9ee98e92f961c727cf991589611a2de7cb'

  depends_on 'dbailey/noop/yum-metadata-parser'
  depends_on 'dbailey/noop/rpm4'
  depends_on 'coreutils'

  def install
    
    inreplace ['bin/createrepo', 'bin/modifyrepo'], '/usr/share/createrepo', '/usr/local/share/createrepo'
    inreplace ['dmd.py','dumpMetadata.py', 'genpkgmetadata.py', 'readMetadata.py'], '/usr/bin/python', '/usr/bin/env python' 

    system 'make', "prefix=#{prefix}", 'INSTALL=ginstall -p --verbose', 'install'
    
  end
end
