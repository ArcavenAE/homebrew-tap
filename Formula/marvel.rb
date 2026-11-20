class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.073729.8d485b7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-073729-8d485b7/marvel-darwin-arm64"
    sha256 "685a1d60fb2b3ca175aa8d914b5109731b84b0d8cb54a86217500c6b845af945"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-073729-8d485b7/marvel-darwin-amd64"
    sha256 "70d2f31bc4f9ee54ace161488990722433e8260c166e5745e05636cddc0ec28f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-073729-8d485b7/marvel-linux-arm64"
    sha256 "d253918bdfa8c8dcff6f7212e4eefc2f41fcee665ca8017f158f6674ab11ca67"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-073729-8d485b7/marvel-linux-amd64"
    sha256 "d703b69bf5bf328c43c29cb007a0b0aa8f65724b6f83d69319ea0232a202d035"
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
