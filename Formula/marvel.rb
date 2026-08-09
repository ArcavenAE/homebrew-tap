class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.072254.15eb3fd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-072254-15eb3fd/marvel-darwin-arm64"
    sha256 "3073cf507c9a30c8a34fd6aeca17289d081e196f77a71ab5cfe9cfe53a8993ef"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-072254-15eb3fd/marvel-darwin-amd64"
    sha256 "1e4d616bd4b41d296da9505538ec3897d86c1ccc41f5eb4a089a5407e5b44be1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-072254-15eb3fd/marvel-linux-arm64"
    sha256 "b7688833646b7742033972f840da6427b10ca8a56f6734077ac312055a7dac93"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-072254-15eb3fd/marvel-linux-amd64"
    sha256 "7a249f5864c21939be315b59f9ac2e1ea589ae91632534c683a3be9c080275ab"
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
