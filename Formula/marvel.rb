class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.093542.026ad51"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093542-026ad51/marvel-darwin-arm64"
    sha256 "3a767224dfb896adcba017dc75ada5a432b46d71b3b84a5e4d5f9c9b559b5c82"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093542-026ad51/marvel-darwin-amd64"
    sha256 "94e262d3c759dd4e103695dbeba4d85c9358263767bcb421b0d32ad103435dc9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093542-026ad51/marvel-linux-arm64"
    sha256 "edac3534aa05674d949e749a874248e7c77153150f0675ad029ec33765dfb1dd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093542-026ad51/marvel-linux-amd64"
    sha256 "1c665679b334321566f789b363eecbb7b7146fb4078c8ed8b889a238d3458500"
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
