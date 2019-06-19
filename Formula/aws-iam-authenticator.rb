VERSION='0.4.0'

class AwsIamAuthenticator < Formula
  desc "A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
  homepage "https://github.com/kubernetes-sigs/aws-iam-authenticator"
  url "https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v#{VERSION}/aws-iam-authenticator_#{VERSION}_darwin_amd64"
  sha256 "b049e08b46d36d6d5087709e5956d6be8f70fc221738d3dd11488e87ce17387f"
  version VERSION

  bottle :unneeded

  def install
    mv "aws-iam-authenticator_#{VERSION}_darwin_amd64", "aws-iam-authenticator"
    bin.install "aws-iam-authenticator"
  end

  test do
    system "#{bin}/aws-iam-authenticator", "help"
  end
end
