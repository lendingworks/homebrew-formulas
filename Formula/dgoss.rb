class Dgoss < Formula
  desc "Convenience wrapper for goss that simplifies Docker container testing"
  homepage "https://goss.rocks"
  url "https://github.com/aelsabbahy/goss/releases/download/v0.3.5/dgoss"
  sha256 "288f5993fb25ec99b756cf9b93ebe6d79d757987255fc1ff15470f16fabf05ea"

  bottle :unneeded

  resource "goss" do
    url "https://github.com/aelsabbahy/goss/releases/download/v0.3.5/goss-linux-amd64"
    sha256 "5669df08e406abf594de0e7a7718ef389e5dc7cc76905e7f6f64711e6aad7fa3"
  end

  def install
    resource("goss").stage {
      mv "goss-linux-amd64", "goss"
      lib.install "goss"
    }

    # Update GOSS_PATH to point to the downloaded goss binary.
    inreplace "dgoss", /^GOSS_PATH=.*/, "GOSS_PATH=\"#{lib}/goss\""

    # The 'mount' strategy won't work in MacOSX, default to 'copy'.
    inreplace "dgoss", /GOSS_FILES_STRATEGY=.*/, "GOSS_FILES_STRATEGY=${GOSS_FILES_STRATEGY:=\"cp\"}"

    bin.install "dgoss"
  end

  test do
    system "#{bin}/dgoss", "--version"
  end
end
