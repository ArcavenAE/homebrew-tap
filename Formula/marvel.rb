class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.081819.c7ca936"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-081819-c7ca936/marvel-darwin-arm64"
    sha256 "ade51ce67e42f9e4444296fd73f8a8d48717f4d1d33b4151e23a9844c61b1786"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-081819-c7ca936/marvel-darwin-amd64"
    sha256 "c2491eafe95a476ae707212cfe145e4a28e157a7e9a21ba214bddbb62206281d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-081819-c7ca936/marvel-linux-arm64"
    sha256 "496896e4c293209eeec8b19727d75a7278ef950f516c73b4f6d9b8d9a8ff02a2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-081819-c7ca936/marvel-linux-amd64"
    sha256 "ae9e9353e8f0c73cbf21d0065a588b71e6b96e7bc6f5e69cf6d7b056e3bb4e86"
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
