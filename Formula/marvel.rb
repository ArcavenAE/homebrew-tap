class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260908.221355.32a7cd2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-221355-32a7cd2/marvel-darwin-arm64"
    sha256 "2229ae6214069cdabcf8fd71f2444e6e6428ba5d682070758002d237357bd2c8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-221355-32a7cd2/marvel-darwin-amd64"
    sha256 "04499cf523c01a08a803a5df5efccb1294bd8458831ee1e3c525c04336b3a739"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-221355-32a7cd2/marvel-linux-arm64"
    sha256 "22a47e1734434243a96904025b7e61f944e910f396fbea73cc7aeaf747f9bb5f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260908-221355-32a7cd2/marvel-linux-amd64"
    sha256 "483f72cf997761f0379751a8dcc9593170bbd676132122b77d1ca9b8b4b05994"
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
