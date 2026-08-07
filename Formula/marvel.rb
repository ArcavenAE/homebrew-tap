class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.091911.27124eb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-091911-27124eb/marvel-darwin-arm64"
    sha256 "2f6bd6faa62cb11c1e245c571aec5638908f0ed577ab91bcbf634d53013a0b1e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-091911-27124eb/marvel-darwin-amd64"
    sha256 "740c36c148addf17e574744b05d97eb63fdcacc162bab4565ee06d2a4b99bfa2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-091911-27124eb/marvel-linux-arm64"
    sha256 "c8aeabe54e9bd6cac9f4793e06c0d35a4abe099cffb24151e7b56a24fd71a10f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-091911-27124eb/marvel-linux-amd64"
    sha256 "6de317ef4d57a5060b49743926007b2f9bc66894e5112da66ae36acd49be4bcf"
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
