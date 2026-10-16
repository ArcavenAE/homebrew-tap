class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.134943.ebfd77d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-134943-ebfd77d/marvel-darwin-arm64"
    sha256 "d150213932b655cb43bd9e78ca3992e595a543c62d04f156de96731e103e71b7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-134943-ebfd77d/marvel-darwin-amd64"
    sha256 "07f8aa5be677d79d5ddd93bf4e09a9ac3c4ea633c592c4823258a4845357ddcd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-134943-ebfd77d/marvel-linux-arm64"
    sha256 "fdff09bf222b69fa1fec671953e51810d37412595c56724aae620c9f0f12b05b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-134943-ebfd77d/marvel-linux-amd64"
    sha256 "6e49a7c6fd0796762e08be6c356d66c9c8d4b9b3075f387a3ea882600bc5bcef"
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
