class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.181948.2932a62"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-181948-2932a62/marvel-darwin-arm64"
    sha256 "35c58d8ebd6e7856b6da0f13d9405583a2d9bf6951158d637f12b7deb62fbfbe"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-181948-2932a62/marvel-darwin-amd64"
    sha256 "ea05a236f1782cd2c87560afa0a43bda6eba969e260a435658bcd77ea5cbd80a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-181948-2932a62/marvel-linux-arm64"
    sha256 "d57b587a1b1f6e19006b16fe64a8f3a408e567a43ce3a7328afb91e85b34cd15"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-181948-2932a62/marvel-linux-amd64"
    sha256 "c4328ae08375dc67f23e565d3f01290670e3f276457ad897bede56e8e2fe238c"
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
