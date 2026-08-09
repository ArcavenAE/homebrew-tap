class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.091136.542f576"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-091136-542f576/marvel-darwin-arm64"
    sha256 "17dd4272877c6f06adc77a4f6e714d4a3319381206e1507235174f2d671c6164"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-091136-542f576/marvel-darwin-amd64"
    sha256 "7dc3a0b8a014ee4a4bbec50c3b5f3612723081f613648ec4f68acbe2071e3858"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-091136-542f576/marvel-linux-arm64"
    sha256 "03f8158baeb8a2caebcdc08ccf5d977beb707a6201d19bf5711dfdc3d65d5c6e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-091136-542f576/marvel-linux-amd64"
    sha256 "0b1ff360eeedbc5bdc2269417aa1abfc5111a4eb879506511bbfbc9118c2ed88"
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
