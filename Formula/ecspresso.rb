ECSPRESSO_VERSION='0.3.4'

class Ecspresso < Formula
  desc "ecspresso is a deployment tool for Amazon ECS"
  homepage "https://github.com/kayac/ecspresso"
  url "https://github.com/kayac/ecspresso/releases/download/v#{ECSPRESSO_VERSION}/ecspresso-v#{ECSPRESSO_VERSION}-darwin-amd64"
  sha256 "4dd3b37a76d265b85bac7f2ce1ec9cef6ea8c1fa30bfa6afc2b18ec0536a3328"
  version ECSPRESSO_VERSION

  bottle :unneeded

  def install
    mv "ecspresso-v#{ECSPRESSO_VERSION}-darwin-amd64", "ecspresso"
    bin.install "ecspresso"
  end

  test do
    system "#{bin}/ecspresso", "--version"
  end
end
