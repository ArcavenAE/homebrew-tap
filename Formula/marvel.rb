class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261121.012927.ec9d00b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-012927-ec9d00b/marvel-darwin-arm64"
    sha256 "aae0488532a011caeabd3427f66df0646e4230709aeed7bc69c1ec7577326e24"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-012927-ec9d00b/marvel-darwin-amd64"
    sha256 "9f82261979e5c0306fcc2f73e8103875d52bde55119baa6d1cac8f6ec17d1b2f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-012927-ec9d00b/marvel-linux-arm64"
    sha256 "1698d1818576f7be48d156ccfcb2f5457d6bcd843df71c18090a25654c9750b6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261121-012927-ec9d00b/marvel-linux-amd64"
    sha256 "14b2612dd7fb2c2e407d82f28a8a37b555d806a5c4c73ad1f63c1a0a1c770cdd"
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
