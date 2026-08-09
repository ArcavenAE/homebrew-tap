class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.083316.f7038da"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-083316-f7038da/marvel-darwin-arm64"
    sha256 "7b44efdef6313bb453620c2aea1cd398c97ce3c31437d5106ed417a371530980"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-083316-f7038da/marvel-darwin-amd64"
    sha256 "59379a22f1f36f8d264763a1817682b9b5e9fdd96c3c82153aa5816f881e5b6a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-083316-f7038da/marvel-linux-arm64"
    sha256 "cc8672a7d1b5c4c6edef81920f4cbddbf6126d4798c7274ee78d86836fe43a60"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-083316-f7038da/marvel-linux-amd64"
    sha256 "7eb6261a747fe076d0715a254746dcc6177cf99ef5be2ff82e52802f9e9449fc"
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
