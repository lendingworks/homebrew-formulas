VERSION='1.0.6'

class Kustomize < Formula
  desc "Customization of kubernetes YAML configurations"
  homepage "https://github.com/kubernetes-sigs/kustomize"
  url "https://github.com/kubernetes-sigs/kustomize/releases/download/v#{VERSION}/kustomize_#{VERSION}_darwin_amd64"
  sha256 "c451b8acc13a47c022d73058c4d8bf928cb1cbe75eaa441eb29f80bd9df2f814"
  version VERSION

  bottle :unneeded

  def install
    mv "kustomize_#{VERSION}_darwin_amd64", "kustomize"
    bin.install "kustomize"
  end

  test do
    system "#{bin}/kustomize", "version"
  end
end
