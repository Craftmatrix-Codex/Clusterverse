import { Head, Link, usePage } from '@inertiajs/react';
import { Button } from '@/components/ui/button';
import { dashboard, login } from '@/routes';
import type { User } from '@/types/auth';

type PageProps = {
    name: string;
    auth: {
        user: User | null;
    };
};

export default function Welcome() {
    const { name, auth } = usePage<PageProps>().props;
    const isAuthenticated = auth.user !== null;

    return (
        <>
            <Head title={name} />

            <div className="flex min-h-screen flex-col bg-background">
                <header className="border-b border-border/60">
                    <div className="mx-auto flex h-16 w-full items-center justify-between px-6 lg:px-8">
                        <Link
                            href="/"
                            className="font-heading text-sm font-semibold tracking-tight"
                        >
                            {name}
                        </Link>

                        <Button asChild size="sm">
                            <Link
                                href={isAuthenticated ? dashboard() : login()}
                            >
                                {isAuthenticated ? 'Dashboard' : 'Log in'}
                            </Link>
                        </Button>
                    </div>
                </header>

                <main className="flex-1" />
            </div>
        </>
    );
}
