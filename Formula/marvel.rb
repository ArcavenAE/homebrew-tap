class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.061838.5482c01"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-061838-5482c01/marvel-darwin-arm64"
    sha256 "75ad4cadd03c04956864fd39a9cefcb9675b31bad5822ce455fca8c442d346c3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-061838-5482c01/marvel-darwin-amd64"
    sha256 "2e7e2500dd6909c540f63ea36d964206afe3e69b43090213f1581027fdbb884c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-061838-5482c01/marvel-linux-arm64"
    sha256 "c582cfc61dd68cb0a4ac6c64a494679cec9421dbd7e573eb36d580aa8f0d8851"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-061838-5482c01/marvel-linux-amd64"
    sha256 "719b33548b6b8340d565adcd47b86d52e6b15e8a5845cb3913d34bc698517b44"
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
