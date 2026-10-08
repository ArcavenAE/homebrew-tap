class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.210513.3f3fc04"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-210513-3f3fc04/marvel-darwin-arm64"
    sha256 "c783eb5018c126fe6cb751b8cd5f480b29c7f8d334bef78f1b6159d915a5f093"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-210513-3f3fc04/marvel-darwin-amd64"
    sha256 "98f8317329313ce38ffcafaf5930238534fe04261f83a0da57542daa6b9cafa6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-210513-3f3fc04/marvel-linux-arm64"
    sha256 "a135ad02c698fe1e19dc058c6567991f492ef4ef09cd0a9726ff57ee70cd7bc6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-210513-3f3fc04/marvel-linux-amd64"
    sha256 "5d7ba7099d4626ef5527d82f72a4afef943cbd305f39459c656ceb8c46ab6533"
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
