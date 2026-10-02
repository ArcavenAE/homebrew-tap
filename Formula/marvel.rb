class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.214822.6c6ee0c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-214822-6c6ee0c/marvel-darwin-arm64"
    sha256 "d71064a392d6143fe61f1bc0b1b36c1e3a8e11fe844ea647c280d7a96d55e09f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-214822-6c6ee0c/marvel-darwin-amd64"
    sha256 "e5d8bd8d271d182462eb53013a635c5d8b3cc00547f20788aaefb9f27ea405c0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-214822-6c6ee0c/marvel-linux-arm64"
    sha256 "ecc495c70618d7f95a2c7871b7bfa563e81049514956082fdbef2fe70ec62ba6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-214822-6c6ee0c/marvel-linux-amd64"
    sha256 "f1eeff5b35ba3f2959e92f1f164191572c78e5ab82cfd7bb8a387430a6819071"
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
