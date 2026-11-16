class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.100540.156613d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-100540-156613d/marvel-darwin-arm64"
    sha256 "379bfcfd47d8f0666d6235fdc4fbff0740c593d60745822d0132437560bf373a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-100540-156613d/marvel-darwin-amd64"
    sha256 "7d89ffb29ee03b99184dfe930c1318a8ea4f6d3a19cf8d937b1fd6bec0127557"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-100540-156613d/marvel-linux-arm64"
    sha256 "81f27df2efb416e72875ca9d42a603c08d2f95fcfac29ca788e52151819a7f25"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-100540-156613d/marvel-linux-amd64"
    sha256 "e136a003d0ff2a08b2e9e75663b89fb9e68c069cb902328952c79e8ca3cc0144"
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
