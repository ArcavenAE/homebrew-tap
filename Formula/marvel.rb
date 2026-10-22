class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.191941.22d5125"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191941-22d5125/marvel-darwin-arm64"
    sha256 "ef8f2665ad30c6b825193f422635a0301ad227e540d032a4d64d1f2c906b2211"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191941-22d5125/marvel-darwin-amd64"
    sha256 "19eb1ba4d0353223b62d6c76833d7a32802856dfa056305e5b36b22564ec6849"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191941-22d5125/marvel-linux-arm64"
    sha256 "939e86fc886eb8631811e9a71e23e4c63d522f6c625b464ff3091b83c93a7850"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191941-22d5125/marvel-linux-amd64"
    sha256 "e846f6f9d7047f4e4dfd66319ef8efcaa60d07848fa10d3e081fca3cd792c6b0"
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
