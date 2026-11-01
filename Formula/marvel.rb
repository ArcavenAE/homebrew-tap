class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.205844.3510ace"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-205844-3510ace/marvel-darwin-arm64"
    sha256 "9d4e52fa1c533920a11fc9d0e0acfb40f1a0dfed3af7d6e6c077430bd82b1fee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-205844-3510ace/marvel-darwin-amd64"
    sha256 "fe198573fe59efcd55c8a3f72f6692f25f6843cb78b6643adf043b809bacdc92"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-205844-3510ace/marvel-linux-arm64"
    sha256 "f7f5fbe415cdb7218773f6e5e34fd22682be2986a96efa0116c63755b33e3b56"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-205844-3510ace/marvel-linux-amd64"
    sha256 "9d05b2c2ca96b2d4bac791c2f9947e53ed0e1f912bc9130315d27f8ea398deaf"
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
