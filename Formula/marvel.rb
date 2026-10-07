class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.234937.4216eb7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-234937-4216eb7/marvel-darwin-arm64"
    sha256 "4f3525211ae0ea77de72438de206291d5baaba68bf14ba7dc5717fa0ce407b41"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-234937-4216eb7/marvel-darwin-amd64"
    sha256 "94f687ceec32e3b34ab83268f6d3e21d060d34525bcf89eb4ef7a56ac04f4ff1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-234937-4216eb7/marvel-linux-arm64"
    sha256 "e5463d8ad7f9a49049f15689ec04cfbae0d1cffc48ba1e0ea9da42babcf21389"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-234937-4216eb7/marvel-linux-amd64"
    sha256 "6ae85cfcb2c3e66bedf002cb9599ee63db66e7955df1c956ada6be40947ccae2"
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
