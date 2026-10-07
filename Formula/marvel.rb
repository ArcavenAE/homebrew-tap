class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.061929.60c2383"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-061929-60c2383/marvel-darwin-arm64"
    sha256 "9fbb3fe3c6021f96fa856ba852b36e381cbe18508f0919b7a18d47ebf06b386b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-061929-60c2383/marvel-darwin-amd64"
    sha256 "7b11cd7a3a29302850c8f03750e2942ee855250258d526b36daa979e9e03c11f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-061929-60c2383/marvel-linux-arm64"
    sha256 "f7a406567857af7325ca6a689a3ad6925967a2f4cb352ce0c03458abde5be7d8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-061929-60c2383/marvel-linux-amd64"
    sha256 "d41a40f53c77e038c653fb0428097427f14d90114bf3f97e1e21ffb07720efe6"
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
