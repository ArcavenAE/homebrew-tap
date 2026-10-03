class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.111352.1c12cfb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111352-1c12cfb/marvel-darwin-arm64"
    sha256 "c126e0d4fc5ed25246897b0146775783d865e93c975ddaea0486843e2f375826"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111352-1c12cfb/marvel-darwin-amd64"
    sha256 "eb82bbc7492baec5d16e85d556a4b4ab2377bdc688baddfdb1d71883445681a8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111352-1c12cfb/marvel-linux-arm64"
    sha256 "b412e77cb2dc7b25f24d8a9d194fb8001856dd60c51de625a40aa55e0eb29438"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111352-1c12cfb/marvel-linux-amd64"
    sha256 "c1f1eedf88f0f14efccc364cb6a01c603aeede992a6fcf611bb96a98850cfb91"
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
