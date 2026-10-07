class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.060448.e8fde2e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-060448-e8fde2e/marvel-darwin-arm64"
    sha256 "1d372064a7171f1d69ffdadedbb4fad9a7c14ba7bc2927ceb601b3e8b3ce0432"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-060448-e8fde2e/marvel-darwin-amd64"
    sha256 "58960d8c2a8f8d6487651b983b8f880aab16a79697f03c1de64a0e82d97ce7f4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-060448-e8fde2e/marvel-linux-arm64"
    sha256 "17abe00b31dc954c563b8192ae00d10b0649f718697b8bf0252c372dec05ab02"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-060448-e8fde2e/marvel-linux-amd64"
    sha256 "b2cc00b3f585f0d687b1f4a67c32c30a40e87fc72e0378d529c8005d3d3f97d7"
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
