class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.063250.6572a53"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063250-6572a53/marvel-darwin-arm64"
    sha256 "ae209844e296c95f5f6d3feb9d903b587e24de1a2e4c6244e91d30c093304c19"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063250-6572a53/marvel-darwin-amd64"
    sha256 "0987f39bde31794cb0cc0b595dfacea23b4294c2dbcfd40c07927790566325ca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063250-6572a53/marvel-linux-arm64"
    sha256 "b37cd01b3b568585920e7b322c422534ac61319ba62e7a0f3a80ba25e185b21d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063250-6572a53/marvel-linux-amd64"
    sha256 "64db0eb6cb0111835c8d5c4a5c5a7d85e63cd8f729570ec5d84bc750462a4938"
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
