class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.214846.871ba37"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-214846-871ba37/marvel-darwin-arm64"
    sha256 "18a8527477e799658d2c261093ab22a65837872207595094f7ed7ef69000327d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-214846-871ba37/marvel-darwin-amd64"
    sha256 "38aa1b6ea9829765be398d4664de481cea54d204d4e1c63d9395f82444974210"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-214846-871ba37/marvel-linux-arm64"
    sha256 "06d03da706d1119cd542819c7075459b535618c2b4df6c1ff6ad5654022ae5a8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-214846-871ba37/marvel-linux-amd64"
    sha256 "dbfff53874093ef2cd8cd6ef397baeb85d297ea4d4be81d8c2752584e00e2d64"
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
