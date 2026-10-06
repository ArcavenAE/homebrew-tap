class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.171959.3e99c36"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171959-3e99c36/marvel-darwin-arm64"
    sha256 "ce12d375533bf4bb50929a1e8a1047f54d2f8576985f5ab9022bd6c9cb5c3654"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171959-3e99c36/marvel-darwin-amd64"
    sha256 "9c4d28a6a762e2d01fc54d4a84fe1ee60621db2eba02abb16e5fe01d08b5cb69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171959-3e99c36/marvel-linux-arm64"
    sha256 "5ee0af19488599a187c5446b014079315cccf303f721aa88f0b1ccc2e9cab145"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171959-3e99c36/marvel-linux-amd64"
    sha256 "b4ec5eb6b3b925d04a24ccd4112925cd18989c2496fe8677b11f5b1dc30b040f"
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
