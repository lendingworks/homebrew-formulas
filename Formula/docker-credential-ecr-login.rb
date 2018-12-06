require 'formula'

REPO_SHA = '5aee214c23492c1bf89f655981f8daf9a16267da'
ARCHIVE_SHA = 'd2373f27ec105cac991a2d2f64765f1efa786bf62d845a746aed269ddbf3678f'

class DockerCredentialEcrLogin < Formula
  homepage 'https://github.com/awslabs/amazon-ecr-credential-helper'
  url "https://github.com/awslabs/amazon-ecr-credential-helper/archive/#{REPO_SHA}.tar.gz"
  head 'https://github.com/awslabs/amazon-ecr-credential-helper.git', :branch => 'master'
  sha256 ARCHIVE_SHA
  version REPO_SHA
  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath

    # Setup build path.
    pkg_path = File.join(buildpath, 'src/github.com/awslabs/')
    mkdir_p pkg_path
    ln_s buildpath, "#{pkg_path}/amazon-ecr-credential-helper"

    system "cd #{pkg_path}/amazon-ecr-credential-helper && make"
    bin.install "bin/local/docker-credential-ecr-login"
  end

  def caveats
    <<~EOS
      Update the contents of your ~/.docker/config.json file to either include:

      {
        "credsStore": "ecr-login"
      }

      Or on a per-registry level, add:

      {
        "credHelpers": {
          "aws_account_id.dkr.ecr.region.amazonaws.com": "ecr-login"
        }
      }
    EOS
  end
end
