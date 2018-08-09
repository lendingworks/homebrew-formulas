VERSION='1.0.5'

class Kustomize < Formula
  desc "Customization of kubernetes YAML configurations"
  homepage "https://github.com/kubernetes-sigs/kustomize"
  url "https://github.com/kubernetes-sigs/kustomize/releases/download/v#{VERSION}/kustomize_#{VERSION}_darwin_amd64"
  sha256 "995179e2726fd1e46897d326621a18326e590f30ab5daad91be44c9adfd246c6"
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
