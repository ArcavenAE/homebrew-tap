class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.044910.0d33f29"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-044910-0d33f29/marvel-darwin-arm64"
    sha256 "d572cde41c52a1475b5f9217b894c458c0996b492edd361e6687b31963d26676"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-044910-0d33f29/marvel-darwin-amd64"
    sha256 "78fa05dc168350da792c44281d194b485eec242769feec3da4441ee23d54bad8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-044910-0d33f29/marvel-linux-arm64"
    sha256 "bd960abf1e3c58f47522a800ad256caef9f36e9a7035130d2666499ca01af5b2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-044910-0d33f29/marvel-linux-amd64"
    sha256 "c1b6f019c470670bdd8d61e3a87747c829b8a8b1f8cc22ba740eb9163fdce8be"
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
