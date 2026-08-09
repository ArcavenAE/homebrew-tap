class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.063009.af4d0b3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063009-af4d0b3/marvel-darwin-arm64"
    sha256 "0447c376853ff59664b1ab48bdf16d1f27c10df69c7083b9209d2e670c68afdb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063009-af4d0b3/marvel-darwin-amd64"
    sha256 "cbe2aef4ce7382d928451241316271a625b0c739fe98657c3ce9bb45b8ec500a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063009-af4d0b3/marvel-linux-arm64"
    sha256 "942a07dee6cfbe1fd87b8ee2549ced825a5c41e48fc890d3b2cc707c7d10b834"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063009-af4d0b3/marvel-linux-amd64"
    sha256 "23f5a953e3173592858df3d0e82f85b26167fcfff39148c06455ab4bfebb14ce"
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
