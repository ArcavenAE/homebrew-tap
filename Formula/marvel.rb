class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.065220.0b56f3e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-065220-0b56f3e/marvel-darwin-arm64"
    sha256 "3c454ccb0fe61f3c46f7f4baedc65490139e1c97dbfaf9ceb359f2462e7810b2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-065220-0b56f3e/marvel-darwin-amd64"
    sha256 "09fe089a3b2e89e1d0371d36ba6baae0259bdee6453b009b893a05f4c6f0b3f7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-065220-0b56f3e/marvel-linux-arm64"
    sha256 "db61095aa5415502b9e14c02283d1dd366f319c0755d72ea40ba7e476b9b7e2b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-065220-0b56f3e/marvel-linux-amd64"
    sha256 "07871df2e4d23f1fafc0ed509ecc9fd0915c5d08b8ec593fbd7ff74e251ca028"
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
