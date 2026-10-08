class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.203533.782a09c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-203533-782a09c/marvel-darwin-arm64"
    sha256 "8561f07d96cc2b6df46b420d2e44455864241c943c09a904fc790ee33234efd1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-203533-782a09c/marvel-darwin-amd64"
    sha256 "8c6b4ec709ef4b36eb19257e14e0f2165ad0f584f4ce776273f477bdee2790ce"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-203533-782a09c/marvel-linux-arm64"
    sha256 "b5e417a977a756e7662da67f419c70d8ad00473637256cb9d48da1c6ea2d4739"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-203533-782a09c/marvel-linux-amd64"
    sha256 "b601df2e623f4382655563df4197613b25aff6ee04b6f263fa633439a986647a"
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
