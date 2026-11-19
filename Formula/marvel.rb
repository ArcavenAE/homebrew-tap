class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.005513.a08fc2c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-005513-a08fc2c/marvel-darwin-arm64"
    sha256 "d964579119e161565052549584e336455d74b06bfda70cf0b6a73573640e3932"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-005513-a08fc2c/marvel-darwin-amd64"
    sha256 "00d0317b97b78fa520c596db6308e002447101849562ae7906de1ca567e9f5c9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-005513-a08fc2c/marvel-linux-arm64"
    sha256 "1e2aadf57f2120b01fa816a031d1bfac49b45d5adca6bcecbf9577e708b5d5b5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-005513-a08fc2c/marvel-linux-amd64"
    sha256 "5bf9a4a1643377d3174a2cd26893ead41be3ce5521739a17eeaf174a0cca2054"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
