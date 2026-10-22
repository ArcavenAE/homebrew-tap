class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.063323.2e2212c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-063323-2e2212c/marvel-darwin-arm64"
    sha256 "4bde5c4ea5943eb340fefe0b045cb61255ee370ca3bc242628b3a7d11eda121e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-063323-2e2212c/marvel-darwin-amd64"
    sha256 "99e1f8d2d4065e69b8c7be1b18763a83309b617440419018f40e918eae445cc8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-063323-2e2212c/marvel-linux-arm64"
    sha256 "5724c177a3fdc3674d63326687c9b5c41d457812bd06232e1e0ec849c8d0c94d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-063323-2e2212c/marvel-linux-amd64"
    sha256 "9e8e10c9ead2eb0792ec7bdb280f63d24af0d2d1e7253eef7cb563e247a0d42c"
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
