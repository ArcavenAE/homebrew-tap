class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261127.022102.ab1cecc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-022102-ab1cecc/marvel-darwin-arm64"
    sha256 "7599d26cc168ad4487ba6b94233b74521aacbea6281ee5e8fd7acef7cb38cdeb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-022102-ab1cecc/marvel-darwin-amd64"
    sha256 "a6ddccc06ea3ca48f00bd3030c093be0befe11992d2d535aa01f629764c71f93"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-022102-ab1cecc/marvel-linux-arm64"
    sha256 "c7f356a552cc186b7bb9ce6b2f65114b6ae344acc10e4b34c1093da485ef2f17"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-022102-ab1cecc/marvel-linux-amd64"
    sha256 "b1162b5c07b4d1b1f2fcbb17007a2b291c3510829bd61b34001cde1fa6069a33"
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
