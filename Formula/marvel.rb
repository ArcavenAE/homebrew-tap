class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.183511.699fe8c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183511-699fe8c/marvel-darwin-arm64"
    sha256 "b55a75d68fe87378829f7b0d03611f20efe7817d5991939a6eca0652f1ec9387"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183511-699fe8c/marvel-darwin-amd64"
    sha256 "79f5fe80228d84f4babba08631cb300c458dcaa08bcbd769164b43d4768d3002"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183511-699fe8c/marvel-linux-arm64"
    sha256 "82b4e37d8a3672674e9da7969c4bf0bd9e2166728001de11496cfe324e7d26f0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183511-699fe8c/marvel-linux-amd64"
    sha256 "687ad45acb2531712257f8104f434c6aa24e7b0f6d42e93fabc909e19d67b1f1"
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
