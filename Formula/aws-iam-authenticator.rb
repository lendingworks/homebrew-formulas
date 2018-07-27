VERSION='0.3.0'

class AwsIamAuthenticator < Formula
  desc "A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
  homepage "https://github.com/kubernetes-sigs/aws-iam-authenticator"
  url "https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v#{VERSION}/heptio-authenticator-aws_#{VERSION}_darwin_amd64"
  sha256 "9585d9af8d2f3b46b31649fb549978f4aedf2d62113fd42b57f9903ad71811c2"
  version VERSION

  bottle :unneeded

  def install
    mv "heptio-authenticator-aws_#{VERSION}_darwin_amd64", "aws-iam-authenticator"
    bin.install "aws-iam-authenticator"
  end

  test do
    system "#{bin}/aws-iam-authenticator", "help"
  end
end
